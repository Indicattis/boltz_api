/*
  Warnings:

  - Added the required column `affiliate_tier` to the `BOLTZ_AFFILIATES` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `BOLTZ_AFFILIATES` ADD COLUMN `affiliate_tier` INTEGER NOT NULL;
