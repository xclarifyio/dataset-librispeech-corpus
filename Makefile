
.SUFFIXES: /Dockerfile

clean:
	rm -rf */Dockerfile

all:
	cat files.list | awk '{ print $$1 "/Dockerfile"; }' | xargs make

%/Dockerfile:
	mkdir -p $(@D)
	./fill_template.sh $@ \
		`cat files.list | grep $(@D) | awk '{print $$1; }'` \
		`cat files.list | grep $(@D) | awk '{print $$2; }'` \
		`cat md5sum.txt | grep $(@D) | awk '{print $$1; }'`

