import { Router } from "express";
import { CTR_Access_Affiliate, CTR_Create_Affiliate } from "../modules/controllers/CTR-Affiliate";

const ctr_create_affiliate = new CTR_Create_Affiliate();
const ctr_access_affiliate = new CTR_Access_Affiliate();

const Routes_Affiliate = Router();

Routes_Affiliate.post("/affiliate-insert", ctr_create_affiliate.create);
Routes_Affiliate.post("/affiliate-access", ctr_access_affiliate.login);

export {Routes_Affiliate};