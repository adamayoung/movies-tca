TARGET = Movies
TEST_TARGET = MoviesTests

IOS_DESTINATION = 'platform=iOS Simulator,name=iPhone 16,OS=18.5'
IPAD_DESTINATION = 'platform=iOS Simulator,name=iPad (10th generation),OS=18.5'
VISIONOS_DESTINATION = 'platform=visionOS Simulator,name=Apple Vision Pro,OS=2.5'

.PHONY: clean
clean:
	xcodebuild clean

.PHONY: format
format:
	@swift format -r -p -i .

.PHONY: lint
lint:
	@swift format lint -r -p .

.PHONY: build-ios
build-ios:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build -scheme $(TARGET) -destination $(IOS_DESTINATION)

.PHONY: build-ipados
build-ipados:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build -scheme $(TARGET) -destination $(IPADOS_DESTINATION)

.PHONY: build-visionos
build-visionos:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build -scheme $(TARGET) -destination $(VISIONOS_DESTINATION)

.PHONY: test-ios
test-ios:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build-for-testing -scheme $(TARGET) -only-testing $(TEST_TARGET) -destination $(IOS_DESTINATION)
	set -o pipefail && NSUnbufferedIO=YES xcodebuild test-without-building -scheme $(TARGET) -only-testing $(TEST_TARGET) -destination $(IOS_DESTINATION)

