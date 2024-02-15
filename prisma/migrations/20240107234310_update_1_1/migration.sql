/*
  Warnings:

  - You are about to drop the column `prod_title` on the `BOLTZ_PRODUCTS` table. All the data in the column will be lost.
  - Added the required column `prod_name` to the `BOLTZ_PRODUCTS` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `BOLTZ_PRODUCTS` DROP COLUMN `prod_title`,
    ADD COLUMN `prod_name` VARCHAR(191) NOT NULL,
    MODIFY `prod_status_id` INTEGER NOT NULL DEFAULT 1;
