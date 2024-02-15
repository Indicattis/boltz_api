/*
  Warnings:

  - The primary key for the `BOLTZ_AFFILIATES` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `BOLTZ_CATEGORIES` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `BOLTZ_PRODUCTS` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[affiliate_register]` on the table `BOLTZ_AFFILIATES` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[affiliate_contact]` on the table `BOLTZ_AFFILIATES` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[category_name]` on the table `BOLTZ_CATEGORIES` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `updatedAt` to the `BOLTZ_AFFILIATES` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category_tier` to the `BOLTZ_CATEGORIES` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status_id` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_affiliate_id_fkey`;

-- DropForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` DROP FOREIGN KEY `BOLTZ_PRODUCTS_category_id_fkey`;

-- AlterTable
ALTER TABLE `BOLTZ_AFFILIATES` DROP PRIMARY KEY,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `affiliate_contact` VARCHAR(191) NOT NULL,
    MODIFY `affiliate_logo` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `BOLTZ_CATEGORIES` DROP PRIMARY KEY,
    ADD COLUMN `category_tier` INTEGER NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `BOLTZ_PRODUCTS` DROP PRIMARY KEY,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `status_id` INTEGER NOT NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `category_id` VARCHAR(191) NOT NULL,
    MODIFY `affiliate_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `BOLTZ_PRODUCTSTATUS` (
    `id` INTEGER NOT NULL,
    `status_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `BOLTZ_AFFILIATES_affiliate_register_key` ON `BOLTZ_AFFILIATES`(`affiliate_register`);

-- CreateIndex
CREATE UNIQUE INDEX `BOLTZ_AFFILIATES_affiliate_contact_key` ON `BOLTZ_AFFILIATES`(`affiliate_contact`);

-- CreateIndex
CREATE UNIQUE INDEX `BOLTZ_CATEGORIES_category_name_key` ON `BOLTZ_CATEGORIES`(`category_name`);

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `BOLTZ_CATEGORIES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_affiliate_id_fkey` FOREIGN KEY (`affiliate_id`) REFERENCES `BOLTZ_AFFILIATES`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BOLTZ_PRODUCTS` ADD CONSTRAINT `BOLTZ_PRODUCTS_status_id_fkey` FOREIGN KEY (`status_id`) REFERENCES `BOLTZ_PRODUCTSTATUS`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
