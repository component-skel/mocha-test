
build: components index.js todo-filter.css template.js
	@component build --dev

template.js: template.html
	@component convert $<

components: component.json
	@component install --dev

clean:
	rm -fr build components template.js



node_modules: package.json
	@npm install

test: build node_modules
	@./node_modules/.bin/mocha

testci: test


.PHONY: clean test testci