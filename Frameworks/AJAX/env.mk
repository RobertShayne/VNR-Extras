# Makefile
# 8/8/2013 jichi

all: compress

WGET = wget
ifeq ($(OS),Windows_NT)
  YUI = yuicompressor.cmd
  CLOSURE = closure.cmd
else
  YUI = yuicompressor
  CLOSURE = closure
  #CLOSURE = closure --compilation_level ADVANCED_OPTIMIZATIONS
endif

compress: $(wildcard *.min.js)
download: $(wildcard *.js)

.closure:
	$(CLOSURE) --js_output_file $(OUT) --js $(IN)

.wget:
	$(WGET) -O $(OUT) $(IN)

.yui:
ifdef TYPE
	$(YUI) --type $(TYPE) -o $(OUT) $(IN)
else
	$(YUI) -o $(OUT) $(IN)
endif

# EOF
