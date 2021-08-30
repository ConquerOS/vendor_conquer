#
# Copyright (C) 2020 The ConquerOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CONQUER_HOST_TIME := $(shell date +"%Y%m%d-%H%M")

ifndef CONQUER_BUILD_TYPE
   CONQUER_BUILD_TYPE := UNOFFICIAL
endif

CONQUER_VERSION := 4.6
ifeq ($(TARGET_USE_GAPPS),true)
     CONQUER_BUILD_VERSION := ConquerOS_Raven-$(CONQUER_VERSION)-$(CONQUER_BUILD)-$(CONQUER_HOST_TIME)-$(CONQUER_BUILD_TYPE)-gapps
     CONQUER_BUILD_NUMBER := CQOSP-$(CONQUER_VERSION).$(CONQUER_HOST_TIME)-gapps
else
     CONQUER_BUILD_VERSION := ConquerOS_Raven-$(CONQUER_VERSION)-$(CONQUER_BUILD)-$(CONQUER_HOST_TIME)-$(CONQUER_BUILD_TYPE)-vanilla
     CONQUER_BUILD_NUMBER := CQOSP-$(CONQUER_VERSION).$(CONQUER_HOST_TIME)-vanilla
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.conquer.version=$(CONQUER_VERSION) \
   ro.conquer.build.version=$(CONQUER_BUILD_VERSION) \
   ro.conquer.build.number=$(CONQUER_BUILD_NUMBER) \
   ro.conquer.build.type=$(CONQUER_BUILD_TYPE) \
   ro.caf.revision.tag=$(CAF_REVISION_TAG)
