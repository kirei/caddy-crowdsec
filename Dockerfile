FROM caddy:builder AS builder
RUN xcaddy build \
	--with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
	--with github.com/hslatman/caddy-crowdsec-bouncer/appsec@main \
	--with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
