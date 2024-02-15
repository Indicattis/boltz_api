import { Router } from "express";
import { CTR_Create_Product, CTR_Select_Product } from "../modules/controllers/CTR-Product";

const ctr_create_product = new CTR_Create_Product();
const ctr_select_product = new CTR_Select_Product();

const Routes_Products = Router();

Routes_Products.post("/product-insert", ctr_create_product.create);
Routes_Products.get("/product-select/:id", ctr_select_product.select);
Routes_Products.get("/product-select", ctr_select_product.fetch);

export {Routes_Products};