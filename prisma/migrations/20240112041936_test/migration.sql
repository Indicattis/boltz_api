/*
  Warnings:

  - You are about to alter the column `prod_offer` on the `boltz_products` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Decimal(3,0)`.

*/
-- AlterTable
ALTER TABLE `boltz_products` MODIFY `prod_offer` DECIMAL(3, 0) NOT NULL;
