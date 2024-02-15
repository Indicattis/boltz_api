/*
  Warnings:

  - You are about to drop the column `prod_quantity` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - Added the required column `prod_stock` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `BOLTZ_PRODUCTS` DROP COLUMN `prod_quantity`,
    ADD COLUMN `prod_stock` INTEGER NOT NULL;
