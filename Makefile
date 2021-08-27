# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include hack/commons.mk

CLUSTER = portefaix-chaos-local
KUBE_CONTEXT = kind-portefaix-chaos-local


# ====================================
# D E V E L O P M E N T
# ====================================

##@ Development

.PHONY: clean
clean: ## Cleanup
	@echo -e "$(OK_COLOR)[$(BANNER)] Cleanup$(NO_COLOR)"
	@find . -name "*.retry"|xargs rm -f

.PHONY: check
check: check-kubectl ## Check requirements

.PHONY: validate
validate: ## Execute git-hooks
	@pre-commit run -a

.PHONY: release-prepare
release-prepare: guard-VERSION ## Update release label (VERSION=xxx)
	./hack/scripts/update-manifests-version.sh chaos $(VERSION)

# ====================================
# K I N D
# ====================================

##@ Kind

.PHONY: kind-create
kind-create: ## Creates a local Kubernetes cluster (ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Create Kubernetes cluster ${SERVICE}$(NO_COLOR)"
	@kind create cluster --name=$(CLUSTER) --config=hack/kind-config.yaml --wait 180s

.PHONY: kind-delete
kind-delete: ## Delete a local Kubernetes cluster (ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Create Kubernetes cluster ${SERVICE}$(NO_COLOR)"
	@kind delete cluster --name=$(CLUSTER)

.PHONY: kind-kube-credentials
kind-kube-credentials: ## Credentials for Kind (ENV=xxx)
	@kubectl config use-context $(KUBE_CONTEXT)
