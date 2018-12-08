
CWD		= $(CURDIR)

MODULE	= $(notdir $(CWD))

ifeq ($(OS),Windows_NT)
	EXE = $(MODULE).exe
else
	EXE = $(MODULE).x64
endif

go: $(EXE)
	./$<

$(EXE): Makefile
	go build -o $(EXE) main.go && strip -s $@ ; file $@
	ls -la $@

doxy:
	rm -rf docs ; doxygen doxy.gen 1>/dev/null

