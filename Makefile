.PHONY: compile test
all: install_prereqs test

clean:
	@rm -rf \
		_build/ \
		doc/ \
		priv/ \
		c_src/*.d \
		c_src/*.o

test:
	@epmd >/dev/null 2>&1 &
	@PATH=`pwd`/priv:$$PATH LUA=config/lua/src ./config/rebar3 eunit
	@pkill -9 epmd
