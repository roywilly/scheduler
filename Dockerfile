FROM alpine


# Install required packages
RUN apk add --update --no-cache bash


WORKDIR /usr/scheduler

# Copy files
COPY crontab.* ./
COPY start.sh .
COPY jobs/*.* ./jobs/

# Set execute perm
RUN chmod 777 start.sh 


# User change is last before CMD
RUN addgroup -S -g 1001 radix-non-root-group
# Add a new user "radix-non-root-user" with user id 1001 and include in group
RUN adduser -S -u 1001 -G radix-non-root-group radix-non-root-user
USER 1001

#CMD ["ls", "/etc"]
#CMD ["ls -l"]
#CMD ["ls", "-l"]

# Run cron on container startup
CMD ["./start.sh"]
