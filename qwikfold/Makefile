.SILENT:

VMFILES := $(wildcard *.tcl *.py ) alphafold omegafold commom examples patches python
VMVERSION = 1.0
DIR = $(PLUGINDIR)/noarch/tcl/qwikfold$(VMVERSION)

bins:
win32bins:
dynlibs:
staticlibs:
win32staticlibs:

distrib:
	@echo "Copying qwikfold $(VMVERSION) files to $(DIR)"
	mkdir -p $(DIR) 
	cp -r $(VMFILES) $(DIR) 

