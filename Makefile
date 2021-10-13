BUILD-NUMBER = 0

.PHONY: create 
create:
	fvm use ${version} --force
	fvm flutter create .

.PHONY: clear
clear:
	rm -rf lib android ios macos test web 
	rm -rf .metadata .packages *.iml
	rm -rf pubspec.lock pubspec.yaml
	rm -rf analysis_options.yaml

.PHONY: doctor
doctor:
	fvm flutter doctor
	
.PHONY: devices
devices:
	fvm flutter devices
	
.PHONY: clean
clean:
	fvm flutter clean
	
.PHONY: pub-get
pub-get:
	fvm flutter pub get

.PHONY: build-runner
build-runner:
	fvm flutter pub pub run build_runner watch --delete-conflicting-outputs
