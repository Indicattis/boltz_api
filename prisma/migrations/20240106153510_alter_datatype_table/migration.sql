/*
  Warnings:

  - The primary key for the `BOLTZ_AFFILIATES` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `BOLTZ_AFFILIATES` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `BOLTZ_CATEGORIES` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `BOLTZ_CATEGORIES` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `category_id` on the `BOLTZ_PRODUCTS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `affiliate_id` on the `BOLTZ_PRODUCTS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_affiliate_id_fkey`;

-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_category_id_fkey`;

-- AlterTable
ALTER TABLE `BOLTZ_AFFILIATES` DROP PRIMARY KEY,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `BOLTZ_CATEGORIES` DROP PRIMARY KEY,
    MODIFY `id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `BOLTZ_PRODUCTS` MODIFY `category_id` INTEGER NOT NULL,
    MODIFY `affiliate_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `BOLTZ_CATEGORIES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_affiliate_id_fkey` FOREIGN KEY (`affiliate_id`) REFERENCES `BOLTZ_AFFILIATES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
