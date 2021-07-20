CC=gcc
build: clean build_debugger build_client
build_client:
	${CC}  --static hello_world.c -o helloWorld
build_debugger:
	${CC} -Wall -pedantic --std=c99 dummy_debugger.c -o dummyDebugger
run:
	./dummyDebugger helloWorld
clean: clean_debugger clean_client
	rm -rf temp
clean_debugger:
	rm -f dummyDebugger
clean_client:
	rm -f helloWorld
dump: clean_client build_client 
	mkdir -p temp
	objdump -d helloWorld > ./temp/helloWorld.dump
	
