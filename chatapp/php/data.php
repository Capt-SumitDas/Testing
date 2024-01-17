<?php
while ($row = $sql->fetch_assoc()) {
    $sql2 = "SELECT * FROM messages 
             WHERE (incoming_msg_id = ? OR outgoing_msg_id = ?) 
             AND (outgoing_msg_id = ? OR incoming_msg_id = ?) 
             ORDER BY msg_id DESC LIMIT 1";

    // Using prepared statements to prevent SQL injection
    $stmt = $conn->prepare($sql2);
    $stmt->bind_param("iiii", $row['unique_id'], $row['unique_id'], $outgoing_id, $outgoing_id);
    $stmt->execute();
    $query2 = $stmt->get_result();
    
    $row2 = null; // Initialize $row2

    if ($query2->num_rows > 0) {
        $row2 = $query2->fetch_assoc();
        $result = $row2['msg'];
    } else {
        $result = "No message available";
    }

    // trimming message if words are more than 28
    $msg = (strlen($result) > 28) ? substr($result, 0, 28) . '...' : $result;

    // adding "You: " text before msg if login id sent msg
    $you = ($row2 && $outgoing_id == $row2['outgoing_msg_id']) ? "You: " : "";

    $output .= '<a href="chat.php?user_id=' . $row['unique_id'] . '">
                    <div class="content">
                        <img src="php/images/' . $row['img'] . '" alt="">
                        <div class="details">
                            <span>' . $row['fname'] . " " . $row['lname'] . '</span>
                            <p>' . $you . $msg . '</p>
                        </div>
                    </div>
                    <div class="status-dot"><i class="fas fa-circle"></i></div>
                </a>';
}

$stmt->close();
$conn->close();
?>
