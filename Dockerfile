FROM google/cloud-sdk:alpine
LABEL maintainer="me@x1unix.com"

ENV GCB_DIR /var/google/course-builder

ENV GCB_PRODUCT_VERSION '1.11.001'

# Enable collection of stats on numbers of calls to the datastore,
# memcache, and email-sending backends.  Used for profiling CourseBuilder
# to improve performance.  See
# https://cloud.google.com/appengine/docs/python/tools/appstats
ENV GCB_APPSTATS_ENABLED 'false'
ENV GCB_TEST_MODE 'false'

# Some core modules are used by other modules at registration time. We
# register them first in the order declared here. Adding items to this list
# is discouraged; new modules should avoid these dependencies.
ENV GCB_PRELOADED_MODULES 'modules.help_urls.help_urls\nmodules.dashboard.dashboard'

# Import source folder
ADD coursebuilder ${GCB_DIR}

# Set as workdir
WORKDIR ${GCB_DIR}

# Install build essentials
RUN apk update && apk add alpine-sdk libxml2-dev libxslt-dev openjdk7-jre python py-pip python-dev libffi-dev openssl-dev

RUN pip install -U setuptools

# Install all dependencies
RUN pip install -r requirements.txt

RUN gcloud components install app-engine-python-extras app-engine-python

# Start server
ENTRYPOINT [ "python", "/google-cloud-sdk/bin/dev_appserver.py", "--port", "8080", "--host", "0.0.0.0", "app.yaml" ]