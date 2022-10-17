FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="http://github.com/tarfin-labs/cherry-pick-github-action"
LABEL homepage="http://github.com/tarfin-labs/cherry-pick-github-action"
LABEL maintainer="Tarfin Labs."
LABEL "com.github.actions.name"="Cherry Pick Action"
LABEL "com.github.actions.description"="Automatically Cherry Pick PR on '/cherry-pick <target>' comment"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="purple"

RUN apk --no-cache add jq bash curl git git-lfs github-cli

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
