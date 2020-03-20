  
FROM node:4.6
WORKDIR /app
COPY ... /app
RUN npm installl
EXPOSE 3000
CMD ["npm", "start"]