/*
  Warnings:

  - A unique constraint covering the columns `[affiliate_mail]` on the table `BOLTZ_AFFILIATES` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `BOLTZ_AFFILIATES_affiliate_mail_key` ON `BOLTZ_AFFILIATES`(`affiliate_mail`);
