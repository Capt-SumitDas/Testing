<?php
    session_start();
    if (isset($_SESSION['unique_id'])) {
        include_once "config.php";
        $outgoing_id = mysqli_real_escape_string($conn, $_POST['outgoing_id']);
        $incoming_id = mysqli_real_escape_string($conn, $_POST['incoming_id']);
        $output = "";

        $sql = $conn->query("SELECT * FROM messages
                                LEFT JOIN users ON users.unique_id = messages.outgoing_msg_id
                                WHERE (outgoing_msg_id = {$outgoing_id} AND incoming_msg_id = {$incoming_id}) 
                                OR (outgoing_msg_id = {$incoming_id} AND incoming_msg_id = {$outgoing_id}) ORDER BY msg_id");

        if (mysqli_num_rows($sql) > 0) {
            while($row = $sql->fetch_assoc()) {
                if ($row['outgoing_msg_id'] === $outgoing_id) { // if this is equal to then he is a msg sender
                    $output .= '<div class="chat outgoing">
                                    <div class="details">
                                        <p>'. $row['msg'] .'</p>
                                    </div>
                                </div>';
                } else { // he is a msg receiver
                    $output .= '<div class="chat incoming">
                                    <img src="php/images/'. $row['img'] .'" alt="">
                                    <div class="details">
                                        <p>'. $row['msg'] .'</p>
                                    </div>
                                </div>';
                }
            }
            echo $output;
        }
    } else {
        header("../login.php");
    }