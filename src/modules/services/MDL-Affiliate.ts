import { Affiliate, Product } from "@prisma/client";
import { prisma } from "../../prisma";
import { ProductDTO } from "../repositories/models/DTO-Product";
import { AppError } from "../../errors/AppError";
import { AffiliateDTO } from "../repositories/models/DTO-Affiliate";
import jwt from 'jsonwebtoken';
import * as bcrypt from 'bcrypt';


export class Create_Affiliate {
    async execute(data: AffiliateDTO): Promise<Affiliate> {
        // VERIFICAR SE O PRODUTO JÁ EXISTE
        const itemAlreadyExists = await prisma.affiliate.findUnique ({
            where: {
                affiliate_mail: data.affiliate_mail,
                id: data.id,
                affiliate_register: data.affiliate_register
            }
        })
        if (itemAlreadyExists) {
            throw new AppError("Afiliado já possui cadastro!")
        }
        // CRIAR PRODUTO
        const item = await prisma.affiliate.create({
            data: {
                affiliate_register: data.affiliate_register,
                affiliate_password: data.affiliate_password,
                affiliate_name: data.affiliate_name,
                affiliate_mail: data.affiliate_mail,
                affiliate_contact: data.affiliate_contact,
                affiliate_logo: data.affiliate_logo,
                affiliate_tier: 1
            }
        });

        return item;
    }
}

export class Access_Affiliate {
  async login(data: AffiliateDTO) {
    const affiliate = await prisma.affiliate.findUnique({
      where: {
        affiliate_register: data.affiliate_register,
      },
    });

    if (affiliate) {

      const token = jwt.sign(
        {
          affiliate_id: affiliate.id,
          affiliate_name: affiliate.affiliate_name,
          affiliate_mail: affiliate.affiliate_mail,
          affiliate_contact: affiliate.affiliate_contact,
          affiliate_tier: affiliate.affiliate_tier,
        },
        'admin_token',
        { expiresIn: '1h' }
      );

      return { token, authenticated: true };
    } else {
      return "Usuário não encontrado"
    }
  }
}