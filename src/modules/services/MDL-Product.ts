import { Product } from "@prisma/client";
import { prisma } from "../../prisma";
import { ProductDTO } from "../repositories/models/DTO-Product";
import { AppError } from "../../errors/AppError";




export class Create_Product {
    async execute(data: ProductDTO): Promise<Product> {
        // VERIFICAR SE O PRODUTO JÁ EXISTE
        // const itemAlreadyExists = await prisma.product.findUnique ({
        //     where: {
        //         id: data.id
        //     }
        // })
        // if (itemAlreadyExists) {
        //     throw new AppError("Product already exists")
        // }
        // CRIAR PRODUTO
        const item = await prisma.product.create({
            data: {
                prod_name: data.prod_name,
                prod_price: data.prod_price,
                prod_offer: data.prod_offer,
                prod_stock: data.prod_stock,
                prod_description: data.prod_description,
                prod_image: data.prod_image,
                prod_category_id: data.prod_category_id,
                prod_affiliate_id: data.prod_affiliate_id,
                prod_status_id: 1,
            }
        });
 
        return item;
    }
}

export class Select_Product {
    
    async fetch(): Promise<Product[]> {
        const items = await prisma.product.findMany();
        return items;
    }

    async query_id(id: string): Promise<Product | null> {
        const item = await prisma.product.findUnique({
            where: {
                id: id,
            },
        });
        return item;
    }
}