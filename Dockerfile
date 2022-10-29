FROM gradle:7.4.2-jdk17-alpine AS dependencies
WORKDIR /app
COPY ./ ./
ENV GRADLE_USER_HOME=/root/build/
RUN gradle dependencies --no-daemon -i --stacktrace

FROM gradle:7.4.2-jdk17-alpine
COPY --from=dependencies /root/build /root/.gradle
