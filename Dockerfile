FROM node:14.15.1 
COPY . .
CMD ["serve", "-p", "80", "-s", "."]
