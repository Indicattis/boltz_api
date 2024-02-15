import { Request, Response } from "express";
import { ProductDTO } from "../repositories/models/DTO-Product";
import { Create_Product, Select_Product } from "../services/MDL-Product";
import { Access_Affiliate, Create_Affiliate } from "../services/MDL-Affiliate";
import { AffiliateDTO } from "../repositories/models/DTO-Affiliate";




export class CTR_Create_Affiliate {
    async create(req: Request, res: Response){
        const data: AffiliateDTO = req.body;

        const newAffiliate = new Create_Affiliate();

        const result = await newAffiliate.execute( data );

        return res.status(201).json(result);
    }
}

export class CTR_Access_Affiliate {
    async login(req: Request, res: Response){
        const data: AffiliateDTO = req.body;

        const newAffiliate = new Access_Affiliate();

        const result = await newAffiliate.login( data );

        return res.status(201).json(result);
    }
}