/*
  Warnings:

  - You are about to drop the column `affiliate_id` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `category_id` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_description` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_image` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_offer` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_price` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_quantity` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `product_title` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - You are about to drop the column `status_id` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - Added the required column `prod_affiliate_id` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_category_id` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_offer` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_price` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_quantity` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_status_id` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prod_title` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_affiliate_id_fkey`;

-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_status_id_fkey`;

-- AlterTable
ALTER TABLE `BOLTZ_PRODUCTS` DROP COLUMN `affiliate_id`,
    DROP COLUMN `category_id`,
    DROP COLUMN `product_description`,
    DROP COLUMN `product_image`,
    DROP COLUMN `product_offer`,
    DROP COLUMN `product_price`,
    DROP COLUMN `product_quantity`,
    DROP COLUMN `product_title`,
    DROP COLUMN `status_id`,
    ADD COLUMN `prod_affiliate_id` INTEGER NOT NULL,
    ADD COLUMN `prod_category_id` INTEGER NOT NULL,
    ADD COLUMN `prod_description` VARCHAR(191) NULL,
    ADD COLUMN `prod_image` VARCHAR(191) NULL,
    ADD COLUMN `prod_offer` INTEGER NOT NULL,
    ADD COLUMN `prod_price` DECIMAL(10, 2) NOT NULL,
    ADD COLUMN `prod_quantity` INTEGER NOT NULL,
    ADD COLUMN `prod_status_id` INTEGER NOT NULL,
    ADD COLUMN `prod_title` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_prod_category_id_fkey` FOREIGN KEY (`prod_category_id`) REFERENCES `BOLTZ_CATEGORIES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_prod_affiliate_id_fkey` FOREIGN KEY (`prod_affiliate_id`) REFERENCES `BOLTZ_AFFILIATES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_prod_status_id_fkey` FOREIGN KEY (`prod_status_id`) REFERENCES `BOLTZ_PRODUCTSTATUS`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
