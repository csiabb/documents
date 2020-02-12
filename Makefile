# -------------------------------------------------------------
# This makefile defines the following targets
#
#   - all (default) - builds all targets
#   - docs - clean env and build docs file
#	- htmldocs - build html docs
#   - setvenv - setup python virtual env

OS := $(shell uname -s)
SITELIB = $(shell python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"):
FORMATTER=../bin/plugin_formatter.py
DUMPER=../bin/dump_keywords.py
ifeq ($(shell echo $(OS) | egrep -ic 'Darwin|FreeBSD|OpenBSD|DragonFly'),1)
CPUS ?= $(shell sysctl hw.ncpu|awk '{print $$2}')
else
CPUS ?= $(shell nproc)
endif
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = csiabb
SOURCEDIR     = source
BUILDDIR      = build

all: docs

docs: clean htmldocs

.ONESHELL:
htmldocs: setvenv
	# staticmin
	#SPHINXBUILD=$(SPHINXBUILD) SPHINXPROJ=$(SPHINXPROJ) \
	#SOURCEDIR=$(SOURCEDIR) BUILDDIR=$(BUILDDIR) sh ./setup-virtualenv.sh
	CPUS=$(CPUS) $(MAKE) -f Makefile.sphinx html

#TODO: leaving htmlout removal for those having older versions, should eventually be removed also
clean:
	# -rm -rf htmlout
	-rm -rf build
	# -rm -f .buildinfo
	# -rm -f *.inv
	# -rm -rf *.doctrees
	# @echo "Cleaning up minified css files"
	# find . -type f -name "*.min.css" -delete
	# @echo "Cleaning up byte compiled python stuff"
	# find . -regex ".*\.py[co]$$" -delete
	# @echo "Cleaning up editor backup files"
	find . -type f \( -name "*~" -or -name "#*" \) -delete
	find . -type f \( -name "*.swp" \) -delete

.PHONY: docs clean

# staticmin:
	# cat _themes/srtd/static/css/theme.css | sed -e 's/^[ 	]*//g; s/[ 	]*$$//g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$$/d' | sed -e :a -e '$$!N; s/\n\(.\)/\1/; ta' > _themes/srtd/static/css/theme.min.css

setvenv:
	sh ./setup-virtualenv.sh
