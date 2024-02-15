-- CreateTable
CREATE TABLE `CSD_PRODUCTS` (
    `id` VARCHAR(191) NOT NULL,
    `product_title` VARCHAR(191) NOT NULL,
    `product_price` DOUBLE NOT NULL,
    `product_offer` INTEGER NOT NULL,
    `product_quantity` INTEGER NOT NULL,
    `product_description` VARCHAR(191) NULL,
    `product_image` VARCHAR(191) NULL,
    `category_id` INTEGER NOT NULL,
    `affiliate_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CSD_AFFILIATES` (
    `id` VARCHAR(191) NOT NULL,
    `affiliate_register` VARCHAR(191) NOT NULL,
    `affiliate_password` VARCHAR(191) NOT NULL,
    `affiliate_name` VARCHAR(191) NOT NULL,
    `affiliate_mail` VARCHAR(191) NOT NULL,
    `affiliate_contact` INTEGER NOT NULL,
    `affiliate_logo` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CSD_CATEGORIES` (
    `id` VARCHAR(191) NOT NULL,
    `category_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
