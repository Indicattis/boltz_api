
export interface ProductDTO {
    id: string;
    prod_name: string;
    prod_price: number;
    prod_offer: number;
    prod_stock: number;
    prod_description: string;
    prod_image?:  string | null;
    prod_category_id: number;
    prod_affiliate_id: number;
    prod_status_id?: number;
}
