import { Request, Response } from "express";
import { ProductDTO } from "../repositories/models/DTO-Product";
import { Create_Product, Select_Product } from "../services/MDL-Product";




export class CTR_Create_Product {
    async create(req: Request, res: Response){
        const data: ProductDTO = req.body;

        const newProduct = new Create_Product();

        const result = await newProduct.execute( data );

        return res.status(201).json(result);
    }
}

export class CTR_Select_Product {

    async fetch(req: Request, res: Response) {
        const selectProduct = new Select_Product();
        const result = await selectProduct.fetch();
        return res.status(200).json(result);
    }

    async select(req: Request, res: Response) {
        
        const id = req.params.id;
        const selectProduct = new Select_Product();

        try {
            let result;

            if (id) {
                result = await selectProduct.query_id(id);
                if (!result) {
                    return res.status(404).json({ message: 'Produto não localizádo' });
                }
            } else {
                return res.status(404).json({ message: 'Parâmetro não informado' });
            }

            return res.status(200).json(result);
        } 
        catch (error) {
            console.error(error);
            return res.status(500).json({ message: 'Erro ao buscar produto' });
        }
    }
}