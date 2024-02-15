import { Router } from "express";
import { Routes_Products } from "./Product.routes";
import { Routes_Affiliate } from "./Affiliate.routes";


const routes = Router();

routes.use("/", Routes_Products);
routes.use("/", Routes_Affiliate);

export { routes };