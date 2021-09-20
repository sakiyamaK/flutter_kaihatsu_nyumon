BUILD-NUMBER = 0

.PHONY: create 
create:
	fvm use --force
	fvm flutter create .

.PHONY: clear
clear:
	rm -rf android
	rm -rf ios
	rm -rf macos
	rm -rf test
	rm -rf web
	rm -rf .metadata
	rm -rf .packages
	rm -rf *.iml
	rm -rf pubspec.lock
	rm -rf pubspec.yaml

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
