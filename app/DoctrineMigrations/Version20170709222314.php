<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170709222314 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE app_order (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, order_number VARCHAR(255) NOT NULL, session VARCHAR(255) NOT NULL, placed_at DATETIME NOT NULL, note LONGTEXT DEFAULT NULL, state VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_23FA1E55551F0F81 (order_number), INDEX IDX_23FA1E55A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE app_order_item (id INT AUTO_INCREMENT NOT NULL, order_id INT DEFAULT NULL, product_id INT DEFAULT NULL, quantity INT NOT NULL, INDEX IDX_4F1B4758D9F6D38 (order_id), INDEX IDX_4F1B4754584665A (product_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE app_order ADD CONSTRAINT FK_23FA1E55A76ED395 FOREIGN KEY (user_id) REFERENCES fos_user_user (id)');
        $this->addSql('ALTER TABLE app_order_item ADD CONSTRAINT FK_4F1B4758D9F6D38 FOREIGN KEY (order_id) REFERENCES app_order (id)');
        $this->addSql('ALTER TABLE app_order_item ADD CONSTRAINT FK_4F1B4754584665A FOREIGN KEY (product_id) REFERENCES app_product (id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE app_order_item DROP FOREIGN KEY FK_4F1B4758D9F6D38');
        $this->addSql('DROP TABLE app_order');
        $this->addSql('DROP TABLE app_order_item');
    }
}
