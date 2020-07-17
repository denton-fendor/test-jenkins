# tag::from[]
FROM openliberty/open-liberty:kernel-java8-openj9-ubi
# end::from[]

ARG VERSION=1.0
ARG REVISION=Test

# tag::label[]
LABEL \
  org.opencontainers.image.authors="D.Graesser" \
  org.opencontainers.image.vendor="Open Liberty" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://github.com/OpenLiberty/guide-containerize" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="Open Liberty" \
  name="tradelite" \
  version="$VERSION-$REVISION" \
  summary="The inventory microservice from the Containerizing microservices guide" \
  description="This image contains the inventory microservice running with the Open Liberty runtime."
# end::label[]

# tag::copy-config[]
# tag::config-userID[]
RUN mkdir -p  /config/lib
COPY --chown=1001:0 ./jdbc/* /config/lib
COPY --chown=1001:0 ./server.xml /opt/ol/wlp/usr/servers/defaultServer/configDropins/defaults 
COPY --chown=1001:0 ./tradelite.ear /opt/ol/wlp/usr/servers/defaultServer/dropins
# end::config-userID[]
    # tag::inventory-config[]
#    src/main/liberty/config \
    # end::inventory-config[]
    # tag::config[]
#    /config/
    # end::config[]
# end::copy-config[]

# tag::copy-war[]
# tag::war-userID[]
#COPY --chown=1001:0 \
# end::war-userID[]
    # tag::inventory-war[]
#    target/inventory.war \
    # end::inventory-war[]
    # tag::config-apps[]
#    /config/apps
    # end::config-apps[]
# end::copy-war[]

# tag::configure-sh[]
#RUN configure.sh
# end::configure-sh[]

