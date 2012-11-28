REBAR=./rebar

.PHONY:

all:
	$(REBAR) get-deps compile

clean:
	$(REBAR) clean
	rm -rf doc/*html
	rm -rf doc/*png
	find . -name "*~" -exec rm {} \;
	find . -name ".#*" -exec rm {} \;
	find . -name "erl_crash.dump" -exec rm {} \;
	find . -name "#*#" -exec rm {} \;

## add your dependecies here. --apps [depencencies from otp] -r [our deps]
init_dialyzer:
	dialyzer --apps stdlib kernel erts -r deps --build_plt --output_plt .dialyzer.plt

dialyzer:
	dialyzer --no_native -Wno_return -r ebin --plt .dialyzer.plt

help:
	@echo "Commands:"
	@echo "  Build the system:  \t make"
	@echo "  Clean the project:  \t make clean"
	@echo "  Setup dialyzer:   \t make init_dialyzer"
	@echo "  Run dialyzer:   \t make dialyzer"
