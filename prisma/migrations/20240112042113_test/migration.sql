/*
  Warnings:

  - You are about to alter the column `prod_stock` on the `boltz_products` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Decimal(4,0)`.

*/
-- AlterTable
ALTER TABLE `boltz_products` MODIFY `prod_stock` DECIMAL(4, 0) NOT NULL;
