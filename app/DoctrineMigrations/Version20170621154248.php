<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170621154248 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE products_solutions (solution_id INT NOT NULL, product_id INT NOT NULL, INDEX IDX_58ED14581C0BE183 (solution_id), INDEX IDX_58ED14584584665A (product_id), PRIMARY KEY(solution_id, product_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE solution (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, UNIQUE INDEX UNIQ_9F3329DB5E237E06 (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE products_solutions ADD CONSTRAINT FK_58ED14581C0BE183 FOREIGN KEY (solution_id) REFERENCES app_product (id)');
        $this->addSql('ALTER TABLE products_solutions ADD CONSTRAINT FK_58ED14584584665A FOREIGN KEY (product_id) REFERENCES solution (id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE products_solutions DROP FOREIGN KEY FK_58ED14584584665A');
        $this->addSql('DROP TABLE products_solutions');
        $this->addSql('DROP TABLE solution');
    }
}
