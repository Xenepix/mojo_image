# ===----------------------------------------------------------------------=== #
# Copyright (c) 2023, Modular Inc. All rights reserved.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions:
# https://llvm.org/LICENSE.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# The Dockerfile is provided as reference. Please review the redistribution
# terms of the Mojo license in Section 1 (https://www.modular.com/legal/mojo)
# prior to distributing pre-built container images.
# ===----------------------------------------------------------------------=== #

FROM ubuntu:20.04

# Env
ENV DEFAULT_TZ=Europe/Paris
ENV DEBIAN_FRONTEND=noninteractive

# Setup environment
RUN apt update \
	&& apt install -y python3.8 python3 python3-pip \
	&& apt install -y \
		vim \
   		tzdata \
   		sudo \
   		curl \
   		wget \
   		libedit-dev \
	&& rm -rf /var/lib/apt/lists/*


# Install modular
RUN curl -s https://get.modular.com | sh - && modular install mojo

ARG MODULAR_HOME="/root/.modular"
ENV MODULAR_HOME=$MODULAR_HOME
ENV PATH="$PATH:$MODULAR_HOME/pkg/packages.modular.com_mojo/bin"

# Change permissions to allow for Apptainer/Singularity containers
RUN chmod -R a+rwX /root

CMD ["sleep", "3600"]
