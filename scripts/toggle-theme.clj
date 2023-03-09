#!/usr/bin/bb

(require '[babashka.fs :as fs])
(require '[babashka.process :refer [shell]])

(def dark-theme "nano-dark")
(def light-theme "nano-light")
(def default-theme light-theme)

(def color-theme-file (str (System/getenv "HOME") "/.colortheme"))
(def kitty-theme-dir (str (System/getenv "HOME") "/.config/kitty/themes/"))
(def rofi-theme-dir (str (System/getenv "HOME") "/.config/rofi/"))

(defn get-current-theme []
  (when (fs/exists? color-theme-file)
    (slurp color-theme-file)))

(defn get-next-theme []
  (if (= (get-current-theme) dark-theme)
    light-theme
    dark-theme))

(defn update-color-theme-file []
  (when-not (fs/exists? color-theme-file)
    (spit color-theme-file default-theme))
  (spit color-theme-file (get-next-theme)))

(defn reload-wm []
  (shell "bspc" "wm" "-r"))

(defn toggle-emacs-theme []
  (shell "emacsclient" "--eval" (str "(" (get-next-theme) ")")))

(defn kitty-manual-background-override []
  (let [bg-color (if (= (get-next-theme) light-theme) "#FFFFFF" "#2E3440")]
    (shell "kitty" "@" "--to" "unix:/tmp/kitty.sock"
           "set-colors" "--all" "--configured"
           (str "background=" bg-color))))

(defn toggle-kitty-theme []
  (when (fs/exists? "/tmp/kitty.sock")
    (shell "kitty" "@" "--to" "unix:/tmp/kitty.sock"
           "set-colors" "--all" "--configured"
           (str kitty-theme-dir (get-next-theme) ".conf"))
    (kitty-manual-background-override))
  (fs/delete-if-exists (str kitty-theme-dir "current-theme.conf"))
  (fs/copy (str kitty-theme-dir (get-next-theme) ".conf")
           (str kitty-theme-dir "current-theme.conf")))

(defn toggle-rofi-theme []
  (fs/delete-if-exists (str rofi-theme-dir "config.rasi"))
  (fs/copy (str rofi-theme-dir (get-next-theme) ".rasi")
           (str rofi-theme-dir "config.rasi")))

(defn main []
  (toggle-emacs-theme)
  (toggle-kitty-theme)
  (toggle-rofi-theme)
  (update-color-theme-file)
  (reload-wm))

(main)
