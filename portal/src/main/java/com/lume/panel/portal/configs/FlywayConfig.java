package com.lume.panel.portal.configs;

import jakarta.annotation.PostConstruct;
import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.output.MigrateResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.sql.DataSource;

@Configuration
public class FlywayConfig {

    private static final Logger logger = LoggerFactory.getLogger(FlywayConfig.class);

    @Autowired
    private DataSource dataSource;

    @PostConstruct
    @DependsOn("dataSource")
    public void runFlywayMigration() {
        logger.info("========================================");
        logger.info("=== INICIANDO FLYWAY MANUALMENTE ===");
        logger.info("========================================");
        try {
            Flyway flyway = Flyway.configure()
                    .dataSource(dataSource)
                    .locations("classpath:db/migration")
                    .schemas("public")
                    .baselineOnMigrate(true)
                    .validateOnMigrate(true)
                    .load();
            
            logger.info("Executando migrations...");
            MigrateResult result = flyway.migrate();
            logger.info("=== {} MIGRATION(S) EXECUTADA(S) COM SUCESSO ===", result.migrationsExecuted);
        } catch (Exception e) {
            logger.error("=== ERRO AO EXECUTAR MIGRATIONS ===", e);
            throw new RuntimeException("Falha ao executar migrations do Flyway", e);
        }
        logger.info("========================================");
    }
}

