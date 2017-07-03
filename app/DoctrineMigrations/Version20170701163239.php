<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170701163239 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE product_solution (product_id INT NOT NULL, solution_id INT NOT NULL, INDEX IDX_5483434C4584665A (product_id), INDEX IDX_5483434C1C0BE183 (solution_id), PRIMARY KEY(product_id, solution_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE product_solution ADD CONSTRAINT FK_5483434C4584665A FOREIGN KEY (product_id) REFERENCES app_product (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE product_solution ADD CONSTRAINT FK_5483434C1C0BE183 FOREIGN KEY (solution_id) REFERENCES solution (id) ON DELETE CASCADE');
        $this->addSql('DROP TABLE products_solutions');
        $this->addSql('ALTER TABLE app_product ADD dimension VARCHAR(255) DEFAULT NULL, ADD upc VARCHAR(255) DEFAULT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_3E1784E056FF3ABD ON app_product (upc)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE products_solutions (solution_id INT NOT NULL, product_id INT NOT NULL, INDEX IDX_58ED14581C0BE183 (solution_id), INDEX IDX_58ED14584584665A (product_id), PRIMARY KEY(solution_id, product_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE products_solutions ADD CONSTRAINT FK_58ED14581C0BE183 FOREIGN KEY (solution_id) REFERENCES app_product (id)');
        $this->addSql('ALTER TABLE products_solutions ADD CONSTRAINT FK_58ED14584584665A FOREIGN KEY (product_id) REFERENCES solution (id)');
        $this->addSql('DROP TABLE product_solution');
        $this->addSql('DROP INDEX UNIQ_3E1784E056FF3ABD ON app_product');
        $this->addSql('ALTER TABLE app_product DROP dimension, DROP upc');
    }
}
