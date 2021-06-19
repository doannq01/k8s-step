FROM node:14.15.1 
RUN npm install serve -g 
COPY . .
CMD ["serve", "-p", "80", "-s", "."]
