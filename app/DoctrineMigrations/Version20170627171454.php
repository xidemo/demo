<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170627171454 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE app_product DROP FOREIGN KEY FK_3E1784E012469DE2');
        $this->addSql('ALTER TABLE app_product CHANGE category_id category_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE app_product ADD CONSTRAINT FK_3E1784E012469DE2 FOREIGN KEY (category_id) REFERENCES app_category (id) ON DELETE SET NULL');
        $this->addSql('ALTER TABLE product_image DROP FOREIGN KEY FK_64617F034584665A');
        $this->addSql('ALTER TABLE product_image ADD CONSTRAINT FK_64617F034584665A FOREIGN KEY (product_id) REFERENCES app_product (id) ON DELETE CASCADE');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE app_product DROP FOREIGN KEY FK_3E1784E012469DE2');
        $this->addSql('ALTER TABLE app_product CHANGE category_id category_id INT NOT NULL');
        $this->addSql('ALTER TABLE app_product ADD CONSTRAINT FK_3E1784E012469DE2 FOREIGN KEY (category_id) REFERENCES app_category (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE product_image DROP FOREIGN KEY FK_64617F034584665A');
        $this->addSql('ALTER TABLE product_image ADD CONSTRAINT FK_64617F034584665A FOREIGN KEY (product_id) REFERENCES app_product (id)');
    }
}
