FROM frolvlad/alpine-gcc AS BUILDER
RUN mkdir -p /src
RUN apk add --update alpine-sdk
WORKDIR /src
COPY . .
RUN make build

FROM alpine:3.14.0
RUN mkdir -p /app
WORKDIR /app
COPY --from=BUILDER /src/helloWorld /app
COPY --from=BUILDER /src/dummyDebugger /app
CMD /app/dummyDebugger /app/helloWorld