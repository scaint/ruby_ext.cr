EXT_NAME = ruby_ext
CRYSTAL = crystal
CRYSTAL_PATH = /opt/crystal
LIBS = -ldl -lgc -lpcre -levent -lcrystal -lpthread

$(EXT_NAME).so: $(EXT_NAME).o
	$(CC) -shared -L$(CRYSTAL_PATH)/embedded/lib -L$(CRYSTAL_PATH)/src/ext -o $@ $^ $(LIBS)

$(EXT_NAME).o: $(EXT_NAME).cr
	$(CRYSTAL) compile --cross-compile $<

.PHONY: clean
clean:
	rm -f bc_flags
	rm -f $(EXT_NAME).o
	rm -f $(EXT_NAME).so
