CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
);



CREATE TABLE "products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" REAL NOT NULL,
	"size" TEXT NOT NULL,
	"categoryId" INT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
);



CREATE TABLE "photos" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL UNIQUE,
	"productId" INT NOT NULL,
	"mainPhoto" BOOLEAN NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
);



CREATE TABLE "categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
);



CREATE TABLE "purchase" (
	"id" serial NOT NULL,
	"userId" INT NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL DEFAULT 'NOW()',
	"addressId" INT NOT NULL,
	"cardId" INT NOT NULL,
	CONSTRAINT "purchase_pk" PRIMARY KEY ("id")
);



CREATE TABLE "boughtProducts" (
	"purchaseId" INT NOT NULL,
	"productId" INT NOT NULL,
	"quantity" INT NOT NULL,
	CONSTRAINT "boughtProducts_pk" PRIMARY KEY ("purchaseId","productId")
);



CREATE TABLE "adresses" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" INT NOT NULL,
	"cityId" INT NOT NULL,
	"userId" INT NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
);



CREATE TABLE "cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
);



CREATE TABLE "cards" (
	"id" serial NOT NULL,
	"number" TEXT NOT NULL UNIQUE,
	"securityCode" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"validityMonth" INT NOT NULL,
	"validityYear" INT NOT NULL,
	"ownerCpf" TEXT NOT NULL UNIQUE,
	"userId" INT NOT NULL,
	CONSTRAINT "cards_pk" PRIMARY KEY ("id")
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk1" FOREIGN KEY ("addressId") REFERENCES "adresses"("id");
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk2" FOREIGN KEY ("cardId") REFERENCES "cards"("id");

ALTER TABLE "boughtProducts" ADD CONSTRAINT "boughtProducts_fk0" FOREIGN KEY ("purchaseId") REFERENCES "purchase"("id");
ALTER TABLE "boughtProducts" ADD CONSTRAINT "boughtProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");


ALTER TABLE "cards" ADD CONSTRAINT "cards_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");










