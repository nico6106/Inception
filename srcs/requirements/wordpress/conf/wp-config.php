<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link https://fr.wordpress.org/support/article/editing-wp-config-php/ Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define('DB_NAME', 'SQL_DATABASE');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'SQL_USER');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', 'SQL_PASSWORD');

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', 'mariadb');

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

define( 'WP_ALLOW_REPAIR', true ); #

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         ';.s+=/NXYzBVsf)|T+D^BW/hrMPrI[)yfCy~#dfSM?+!oRh1f*<i?ByzJwjyWpB!');
define('SECURE_AUTH_KEY',  'OoaqB6hg]D/,4g?MfN>W6i|+P0bdnQj%{k9q{]:MHr)?K^+G8@ EwSk1>G9sZ2Uu');
define('LOGGED_IN_KEY',    '+c5+x/u2+L{-(@-`p+-Zg *}GblfL<|ASY&M|Wn:?-m=y.t1|LPeklN90;SXuv&O');
define('NONCE_KEY',        '7tR!3J_83]hyMMuh,QB@(l8x,G6E:BYkw{|)E 9sOq!cIr&NWl6)!+2|4fqydN>=');
define('AUTH_SALT',        'm5~%k::d4J3PA4[}L[Cm`>UP=@z}({~yJ}V]UAct0D.a+cqbR(~_kxb~vPiz|e%M');
define('SECURE_AUTH_SALT', 'i^-(%XbUD-SHxk-,q7mK9%d2P6,)(zk*$S|$2k&|RDxIz}1qj[hoI6LE#[^c6EGo');
define('LOGGED_IN_SALT',   '0nV:_&69-`kv*tO1{|z-d.w)a04kDi=`,||].1<k+g@!;$YPV(+GvR<:{P(1;33v');
define('NONCE_SALT',       '`k_m7ULL-kXljO*EAcN{LpwW+_K+/gB@doGkq}|b`Io*>%?ax[$sc_L0y2FyW-at');

#define('AUTH_KEY',         'put your unique phrase here');
#define('SECURE_AUTH_KEY',  'put your unique phrase here');
#define('LOGGED_IN_KEY',    'put your unique phrase here');
#define('NONCE_KEY',        'put your unique phrase here');
#define('AUTH_SALT',        'put your unique phrase here');
#define('SECURE_AUTH_SALT', 'put your unique phrase here');
#define('LOGGED_IN_SALT',   'put your unique phrase here');
#define('NONCE_SALT',       'put your unique phrase here');

/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs et développeuses : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur la documentation.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');