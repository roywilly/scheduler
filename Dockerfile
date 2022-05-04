FROM alpine


# Install required packages
RUN apk add --update --no-cache bash


RUN addgroup -S -g 1001 radix-non-root-group

# Add a new user "radix-non-root-user" with user id 1001 and include in group
RUN adduser -S -u 1001 -G radix-non-root-group radix-non-root-user

USER 1001

WORKDIR /usr/scheduler

# Copy files
COPY crontab.* ./
COPY start.sh .
COPY jobs/*.* ./jobs/

#CMD ["ls", "/etc"]
CMD ["pwd"]

# Run cron on container startup
# CMD ["./start.sh"]
